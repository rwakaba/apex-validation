public class ValidationResults {
    private Map<String, Result> results = new Map<String, Result>();

    public void put(String key, Result r) {
        results.put(key, r);
    }
    public Result result(String key) { return results.get(key); }
    
    public Boolean hasError(String key) {
        return results.containsKey(key);
    }
    public Result get(String key) {
        return results.get(key);
    }
    public void addRequiredError(String itemName) {
    results.put(itemName, new Result(new ValidationType.Required()));
    }
    public void addMaxLengthError(String itemName, Integer len) {
    results.put(itemName, new Result(new ValidationType.MaxLength(len)));
    }
    public void addPatternError(String itemName, String pattern) {
    results.put(itemName, new Result(new ValidationType.Pattern(pattern)));
    }
    public void addMaxError(String itemName, Integer len) {
    results.put(itemName, new Result(new ValidationType.Max(len)));
    }
    public void addMinError(String itemName, Integer len) {
    results.put(itemName, new Result(new ValidationType.Min(len)));
    }

    public class Result {
        public String itemName  { get; set; }
        public ValidationType type { get; private set; }
        public String validContent { 
            get {
                return type.validContent();
            }
        }
        public Result(ValidationType type) {
            this.type = type;
        }

        public Result(String itemName, ValidationType type) {
            this.itemName = itemName;
            this.type = type;
        }

        public Boolean isRequired {
            get { return type instanceof ValidationType.Required; }
        }
        public Boolean isMaxLength {
            get { return type instanceof ValidationType.MaxLength; }
        }
        public Boolean isPattern {
            get { return type instanceof ValidationType.Pattern; }
        }
        public Boolean isMax {
            get { return type instanceof ValidationType.Max; }
        }
        public Boolean isMin {
            get { return type instanceof ValidationType.Min; }
        }
    }
}
