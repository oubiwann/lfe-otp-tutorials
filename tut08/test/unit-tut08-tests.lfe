(defmodule unit-tut08-tests
  (behaviour ltest-unit)
  (export all)
  (import
    (from ltest
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest code-change
  (is-equal
    #(ok "data")
    (tut08:code_change
       "old version"
       "data"
       "extra")))
