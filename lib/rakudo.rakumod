my constant COMPILER = $*RAKU.compiler;
my constant $VERSION = COMPILER.version;

# Prevent installation if it is never going to work
BEGIN {
    my $NAME := COMPILER.name;
    die "Rakudo::Version is supposed to run on Rakudo, not '$NAME'"
      if $NAME ne 'rakudo';
}

multi sub EXPORT(Version:D $version) {
    $VERSION ~~ $version
      ?? Map.new
      !! die "$version failed to accept release $VERSION of Rakudo";
}

multi sub EXPORT(&matcher) {
    &matcher($VERSION)
      ?? Map.new
      !! die "Version matcher failed to accept release $VERSION of Rakudo";
}

=begin pod

=head1 NAME

Rakudo::Version - provide a "rakudo version" pragma

=head1 SYNOPSIS

=begin code :lang<raku>

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

=end code

=head1 DESCRIPTION

The Rakudo::Version distribution provides a C<use rakudo> pragma that
allows one to specify with which version of Rakudo a program is supposed
to run.

Version checking occurs either by specifying a C<Version> value (which
will be smart-matched with the current compiler C<Version>), or it can
be a C<Callable> which will be given the current C<Version> value,
and which should return a C<Bool> indicating whether or not the Rakudo
release is acceptable.

=head1 PRIOR ART

The L<RakudoPrereq|https://raku.land/zef:raku-community-modules/RakudoPrereq>
module, originally by C<Zoffix Znet>, provides a more general approach to
the problem of limiting a program to a specific release.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Rakudo-Version .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing
to a L<small sponsorship|https://github.com/sponsors/lizmat/> would
mean a great deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
