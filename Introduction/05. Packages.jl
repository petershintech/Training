# # Packages
#
# Julia has over 4400 registered packages, making packages a huge part of the Julia ecosystem.
#
# Even so, the package ecosystem still has some growing to do. Notably, we have first class function calls  to other languages, providing excellent foreign function interfaces. We can easily call into python or R, for example, with `PyCall` or `Rcall`.
#
# This means that you don't have to wait until the Julia ecosystem is fully mature, and that moving to Julia doesn't mean you have to give up your favorite package/library from another language!
#
# To see all available packages, check out
#
# https://juliahub.com/
# or
# https://juliaobserver.com/
#
# For now, let's learn how to use a package.

#-

# The first time you use a package on a given Julia installation, you need to use the package manager to explicitly add it:

using Pkg
Pkg.add("Example")

# Every time you use Julia (start a new session at the REPL, or open a notebook for the first time, for example), you load the package with the `using` keyword

import Example # pythons import example
# using Example # pythons from example import *

# In the source code of `Example.jl` at
# https://github.com/JuliaLang/Example.jl/blob/master/src/Example.jl
# we see the following:
#
# ```
# export hello
#
# hello(who::String) = "Hello, $who"
# ```
#
# Having loaded `Example`, we should now be able to call `hello`

Example.hello("it's me. I was wondering if after all these years you'd like to meet.")

Example.domath(4)

# In the next notebook, we'll use a new package to plot datasets.

import Example
const Ex = Example
Ex.hello("Matt")


#-

# # What happened?
#
# Ask Julia for its status

Pkg.status()

# Examine the Project.toml
#
# The Project.toml holds all high-level dependencies and a unique identifier.

# Examine the Manifest.toml
#
# The Manifest holds _all_ dependencies and their exact versions.

# # Environments
#
# This is all happening in the global environment right now — but we can choose
# to use the environment in this folder. This guarantees reproducibility!

# # Creating your own package
#
# Best way to do this is through the PkgTemplates meta-package

Pkg.add("PkgTemplates")

# Now use the generate(name) function at the REPL to create your new package
