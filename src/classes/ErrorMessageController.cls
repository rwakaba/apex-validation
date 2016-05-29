public class ErrorMessageController {

    public ValidationResults results { get; set; }

    public String key { get; set; }

	public InputResult resultNotInput { get {
		return getResult(new NotInputSpecifer());
	}}

	public InputResult resultBadPattern { get {
		return getResult(new BadPatternSpecifer());
	}}
	public InputResult resultTooLong { get {
		return getResult(new TooLongSpecifer());
	}}
	public InputResult resultBigValue { get {
		return getResult(new BigValueSpecifer());
	}}
	public InputResult resultSmallValue { get {
		return getResult(new SmallValueSpecifer());
	}}

	public Boolean showNotInputError {
		get { return resultNotInput != null; }
	}

	public Boolean showBadPatternError {
		get { return resultBadPattern != null; }
	}
	public Boolean showTooLongError {
		get { return resultTooLong != null; }
	}
	public Boolean showBigError {
		get { return resultBigValue != null; }
	}
	public Boolean showSmallError {
		get { return resultSmallValue != null; }
	}

	// ---------------------- private ----------------------------
	private InputResult getResult(Specifier s) {
		if (results != null) {
			for (InputResult r : results.getResults(key)) {
				if (s.isInstance(r)) {
					return r;
				}
			}
		}
		return null;
	}

	// ---------------------- helper ----------------------------
	private interface Specifier {
		Boolean isInstance(InputResult result);
	}

	private class NotInputSpecifer implements Specifier {
		public Boolean isInstance(InputResult result) {
			return result instanceof InputResult.NotInput;
		}
	}
	private class BadPatternSpecifer implements Specifier {
		public Boolean isInstance(InputResult result) {
			return result instanceof InputResult.BadPattern;
		}
	}
	private class TooLongSpecifer implements Specifier {
		public Boolean isInstance(InputResult result) {
			return result instanceof InputResult.TooLong;
		}
	}
	private class BigValueSpecifer implements Specifier {
		public Boolean isInstance(InputResult result) {
			return result instanceof InputResult.BigValue;
		}
	}
	private class SmallValueSpecifer implements Specifier {
		public Boolean isInstance(InputResult result) {
			return result instanceof InputResult.SmallValue;
		}
	}
}
