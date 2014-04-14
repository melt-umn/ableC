Conditional tables extension
============================

This extension introduces a new expression syntax:

```
table {
  expr1 : T F *
  expr2 : * T F }
```

This expression evaluates to a boolean value, which is true if any of the columns of values match the truth values of the expressions.

Each subexpression is evaluated once.

