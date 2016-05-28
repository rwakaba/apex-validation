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
}
