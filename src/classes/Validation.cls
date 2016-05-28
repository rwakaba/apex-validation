public class Validation {

	public static InputResult checkRequired(Object value) {
		Boolean input = false;
		if (value != null) {
			if (value instanceof String) {
				input = String.isEmpty((String) value);
			} else {
				input = true;
			}
		}
		if (input) {
			return new Valid();
		} else {
			return new NotInput();
		}
	}

	public class Results {
		private Map<String, List<InputResult>> results = new Map<String, List<InputResult>>();

		public void put(String name, InputResult r) {
			getResults(name).add(r);
		}
		//public InputResult result(String key) { return results.get(key); }
		
		public Boolean hasError(String key) {
			return results.containsKey(key);
		}

		// ------------ private -----------
		private List<InputResult> getResults(String name) {
			if (!results.containsKey(name)) {
				List<InputResult> l = new List<InputResult>();
				results.put(name, l);
			}
			return results.get(name);
		}
	}

    public virtual class InputResult {
		public virtual Boolean valid() { return false; }
		public virtual Boolean inValid() { return !valid(); }
		public virtual String validContent() { return null; }

        public virtual Boolean notInput() { return false; }
        public virtual Boolean tooLong() { return false; }
        public virtual Boolean badPattern() { return false; }
        public virtual Boolean overValue() { return false; }
        public virtual Boolean shortValue() { return false; }

	}

	public class Valid extends InputResult {
		public override Boolean valid() { return true;}
	}

	public class NotInput extends InputResult {
		public Integer value { get; private set; }
		public override Boolean notInput() { return true; }
	}
	public class TooLong extends InputResult {
		public Integer value { get; private set; }
		public TooLong(Integer value) {
			this.value = value;
		}
		public override String validContent() {
			return String.valueOf(value);
		}
		public override Boolean tooLong() { return true; }
	}

	public class BadPattern extends InputResult {
		public String pattern { get; private set; }
		public BadPattern(String pattern) {
			this.pattern = pattern;
		}
		public override String validContent() {
			return pattern;
		}
		public override Boolean badPattern() { return true; }
	}

	public class OverValue extends InputResult {
		public Integer value { get; private set; }
		public OverValue(Integer value) {
			this.value = value;
		}
		public override String validContent() {
			return String.valueOf(value);
		}
		public override Boolean overValue() { return true; }
	}

	public class ShortValue extends InputResult {
		public Integer value { get; private set; }
		public ShortValue(Integer value) {
			this.value = value;
		}
		public override String validContent() {
			return String.valueOf(value);
		}
		public override Boolean shortValue() { return true; }
	}
}

