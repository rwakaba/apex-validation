/**
 * holding all validatin results class.
 */
public class ValidationResults {
	private Map<String, List<InputResult>> results = new Map<String, List<InputResult>>();

	public void put(String name, InputResult r) {
		getResults(name).add(r);
	}

	public Boolean hasError(String key) {
		return results.containsKey(key);
	}

	public List<InputResult> getResults(String name) {
		if (!results.containsKey(name)) {
			List<InputResult> l = new List<InputResult>();
			results.put(name, l);
		}
		return results.get(name);
	}
}
