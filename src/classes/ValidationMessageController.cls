public class MessageController {

    public ValidationResults results { get; set; }

    public String key { get; set; }

    public InputResult result {
		get {
			if (results != null) {
				for (InputResult r : results.getResults(key)) {
					if (r instanceof InputResult.NotInput)   return r;
					if (r instanceof InputResult.BadPattern) return r;
					if (r instanceof InputResult.TooLong)    return r;
					if (r instanceof InputResult.BigValue)   return r;
					if (r instanceof InputResult.SmallValue) return r;
				}
			}
			return null;
		}
	}

	public Boolean showNotInputError {
		get { return result instanceof InputResult.NotInput; }
	}
	public Boolean showBadPatternError {
		get { return result instanceof InputResult.BadPattern; }
	}
	public Boolean showTooLongError {
		get { return result instanceof InputResult.TooLong; }
	}
	public Boolean showBigError {
		get { return result instanceof InputResult.BigValue; }
	}
	public Boolean showSmallError {
		get { return result instanceof InputResult.SmallValue; }
	}
}
