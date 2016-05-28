public class Validation {

	/**
	 * check the value to be input
	 * @param value [Object] input value
	 */
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

	/**
	 * check the value to be not over length
	 * @param value [String] input value
	 */
	public static InputResult checkLength(String value, Integer max) {
		if (value != null && value.length() > max) {
			return new TooLong(max);
		}
		return new Valid();
	}

	/**
	 * check the value to be match the pattern
	 * @param value [String] input value
	 */
	public static InputResult checkPattern(String value, String regex, String label) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(value);

		if (!m.matches()) {
			return new BadPattern(label);
		}
		return new Valid();
	}

	/**
	 * check the value to be not over max value
	 * @param value [String] input value
	 */
	public static InputResult checkMax(String value, Integer max) {
		try {
			Integer i = Integer.valueOf(value);
			if (i > max) {
				return new BigValue(max);
			}
			return new Valid();
		} catch (TypeException e) {
			return new InValid();
		}
	}

	/**
	 * check the value to be not over min value
	 * @param value [String] input value
	 */
	public static InputResult checkMin(String value, Integer min) {
		try {
			Integer i = Integer.valueOf(value);
			if (i < min) {
				return new SmallValue(min);
			}
			return new Valid();
		} catch (TypeException e) {
			return new InValid();
		}
	}

	/**
	 * holding all validatin results class.
	 */
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

	/**
	 * represent one validation result class.
	 */
	public virtual class InputResult {
		public virtual Boolean valid() { return false; }
		public virtual Boolean inValid() { return !valid(); }
		public virtual String validContent() { return null; }

		public virtual Boolean notInput() { return false; }
		public virtual Boolean tooLong() { return false; }
		public virtual Boolean badPattern() { return false; }
		public virtual Boolean bigValue() { return false; }
		public virtual Boolean smallValue() { return false; }

	}

	public class Valid extends InputResult {
		public override Boolean valid() { return true;}
	}

	public class InValid extends InputResult {
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

	public class BigValue extends InputResult {
		public Integer value { get; private set; }
		public BigValue(Integer value) {
			this.value = value;
		}
		public override String validContent() {
			return String.valueOf(value);
		}
		public override Boolean bigValue() { return true; }
	}

	public class SmallValue extends InputResult {
		public Integer value { get; private set; }
		public SmallValue(Integer value) {
			this.value = value;
		}
		public override String validContent() {
			return String.valueOf(value);
		}
		public override Boolean smallValue() { return true; }
	}
}

