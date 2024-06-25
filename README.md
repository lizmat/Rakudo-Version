[![Actions Status](https://github.com/lizmat/Rakudo-Version/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/Rakudo-Version/actions)

NAME
====

Rakudo::Version - provide a "rakudo version" pragma

SYNOPSIS
========

```raku
# Exactly this version
use rakudo v2022.01;

# From this version onward
use rakudo v2023.02+;

# More elaborate checks with a Callable
use rakudo { $_ ~~ v2022.01 || $_ ~~ v2022.07+ }

# Custom error message
use rakudo {
    $_ ~~ v2022.07+ || die "$_ is not recent enough for this"
}
```

DESCRIPTION
===========

The Rakudo::Version distribution provides a `use rakudo` pragma that allows one to specify with which version of Rakudo a program is supposed to run.

Version checking occurs either by specifying a `Version` value (which will be smart-matched with the current compiler `Version`), or it can be a `Callable` which will be given the current `Version` value, and which should return a `Bool` indicating whether or not the Rakudo release is acceptable.

PRIOR ART
=========

The [RakudoPrereq](https://raku.land/zef:raku-community-modules/RakudoPrereq) module, originally by `Zoffix Znet`, provides a more general approach to the problem of limiting a program to a specific release.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Rakudo-Version . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

