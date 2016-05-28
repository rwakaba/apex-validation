public class DefaultValidator {

	private Validation.Results results { get; private set; }

	public DefaultValidator() {
		results = new Validation.Results();
	}

	public Validation.InputResult checkRequired(String name, Object value) {
		Validation.InputResult r = Validation.checkRequired(value);
		results.put(name, r);
		return r;
	}

	public Validation.InputResult checkPattern(String name, String value, String regex, String label) {
		Validation.InputResult r = Validation.checkPattern(value, regex, label);
		results.put(name, r);
		return r;
	}

	public Validation.InputResult checkLength(String name, String value, Integer len) {
		Validation.InputResult r = Validation.checkLength(value, len);
		results.put(name, r);
		return r;
	}

	public Validation.InputResult checkMax(String name, String value, Integer max) {
		Validation.InputResult r = Validation.checkMax(value, max);
		results.put(name, r);
		return r;
	}

	public Validation.InputResult checkMin(String name, String value, Integer min) {
		Validation.InputResult r = Validation.checkMin(value, min);
		results.put(name, r);
		return r;
	}
}
