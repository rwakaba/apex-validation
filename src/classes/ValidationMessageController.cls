public class MessageController {
    public ValidationResults results { get; set; }
    public String key { get; set; }

    public Boolean hasError { get { return results.hasError(key); } set; }
    public ValidationResults.Result result { get { return results.get(key); } }
    public Boolean isRequired { get { return hasError && result.isRequired; }}
    public Boolean isMaxLength { get { return hasError && result.isMaxLength; }}
    public Boolean isPattern{ get { return hasError && result.isPattern; }}
    public Boolean isMax { get { return hasError && result.isMax; }}
    public Boolean isMin { get { return hasError && result.isMin; }}
}
