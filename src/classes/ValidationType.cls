public virtual class ValidationType {
    public virtual String validContent() { return null; }

    public class Required extends ValidationType {
    }

    public class MaxLength extends ValidationType {
        public Integer value { get; private set; }
        public MaxLength(Integer value) {
            this.value = value;
        }
        public override String validContent() {
            return String.valueOf(value);
        }
    }

    public class Pattern extends ValidationType {
        public String pattern { get; private set; }
        public Pattern(String pattern) {
            this.pattern = pattern;
        }
        public override String validContent() {
            return pattern;
        }
    }

    public class Max extends ValidationType {
        public Integer value { get; private set; }
        public Max(Integer value) {
            this.value = value;
        }

        public override String validContent() {
            return String.valueOf(value);
        }
    }

    public class Min extends ValidationType {
        public Integer value { get; private set; }
        public Min(Integer value) {
            this.value = value;
        }

        public override String validContent() {
            return String.valueOf(value);
        }
    }
}
