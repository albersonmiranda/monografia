### HELPER FUNCTIONS ###


# get names in list via apply family
.i = function() parent.frame(2)$i[]
# looks for X or .x to handle base and purrr functionals
.n = function() {
    env = parent.frame(2)
    names(c(env$X, env$.x))[env$i[]]
}