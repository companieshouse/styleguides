Perl POD Documentation Standards
================================

**What is it?**

Basically it's just perl pod. If you run it through a vanilla `pod-2<output>` formatter you'll get perfectly valid and readable output.

The difference is that we define a few "special" syntaxes that will be parsed into certain formats in the output.

**Why pod?**

Because it's the standard way of documenting perl code and new developers coming on stream should already be familiar with how it works.

**How does it get generated?**

For CHS the pod is translated to HTML via a plugin to the mojolicious based CH site. It is generated on the fly and rendered as the files are accessed (so don't try to find the rendered files on disk as they don't exist!).

The plugin is based on the standard [Mojolicious::Plugin::PODRenderer](http://search.cpan.org/~sri/Mojolicious-4.16/lib/Mojolicious/Plugin/PODRenderer.pm) module but has been amended to tweak the styling and add things like the ability to view source code and browse an index.

**This is awesome, but I'm new to POD, where can I read more?**

Calm my young Padawan. A good place to start if you're new to pod is the official [perl pod documentation](http://perldoc.perl.org/perlpod.html).

POD in source files - Basic layout
----------------------------------

Your pod should be placed at the end of your source file and structured thus:
* [NAME](#name)
* [SYNOPSIS](#synopsis)
* [DESCRIPTION](#description)
* [ATTRIBUTES](#attributes)
* [METHODS](#methods)

Each of these should be defined using the =head1 directive and included where appropriate (i.e. if there aren't any methods then you don't need a METHODS section).

### NAME

This section should contain the name of the module and optionally a brief sentence about what it is.
```
=head1 NAME

CH::UI::Page - basic page class
```

### SYNOPSIS

This section should contain examples of basic usage of the class. It should be written using a verbatim paragraph.
```
=head1 SYNOPSIS

    use Mojo::Base 'Mojolicious::Controller';

    use ChGovUk::Models::Address;
    use ChGovUk::Models::DataAdapter;

    my $address
        = ChGovUk::Models::Address->new(
                data_adapter => ChGovUk::Models::DataAdapter->new(
                    controller => $self
                )
            );

    $address->load( $config, { address_id => $address_id ) };
```

### DESCRIPTION

This section should contain a more complete description of what the class is and what it does.
```
=head1 DESCRIPTION

This class defines a base class for all pages. It enforces authentication rules and ensures the user isn't a zebra.
```

### ATTRIBUTES

If you want to include a list of attributes in your docs you can do so easily with:
```
=head1 ATTRIBUTES

[[ATTRIBUTES]]
```
This will cause them to be auto-populated when the doc is viewed.

### METHODS

This section should contain the public method definitions.
```
=head1 METHODS
```

Method Docs
-----------

Note, this applies to public methods. [Private methods](#private-methods) should be documented with normal perl comments as they don't form part of the public api.
```
=head2 nameOfMethod ( $param1, $param2 ) [return-type]

Description of what the method does

  @param     param1  [scalar]  the first parameter
  @param     param2  [scalar]  the second parameter
  @returns   some value that we calculated
  @throws    Pancake::Exception

=cut
```

Most of this is just standard pod. The only bits to take note of are:
* [Method signatures](#method-signatures)
* [Parameters, return values, etc.](#parameters-return-values-etc)
* [Named args](#named-args)
* [Param types](#param-types)

### Method signatures

This should be in a head2 and feature parenthesis (even if there are no params - don't add $self as this is implicit)
```
=head2 myMethodWithNoParams()
=head2 myMethodWithAParam($param1)
```

### Parameters, return values, etc.

Just like in [javadoc](https://en.wikipedia.org/wiki/Javadoc) you can specify a set of parameters and return values et al. using a special syntax. These have been chosen and structured the way they are so that if the code is run through a standard pod generator the output will still make sense.

Currently defined tags (each must be prefixed by a tab or spaces on the line to make them [pod verbatim text](http://perldoc.perl.org/perlpod.html#Verbatim-Paragraph)):

Tag        |Description                                                                       |Format                                       |Example
-----------|----------------------------------------------------------------------------------|---------------------------------------------|----------
`@param`   |Defines a parameter passed to the <method>                                        |`@param{tab}name{tab}{type]{tab}description` |`@param age [number] the age of the director`
`@named`   |Defines a named parameter passed as part of a hash                                |`@named{tab}name{tab}[type]{tab}desciption`  |`@named age [number] the age of the director`
`@returns` |Defines the return value from a method (may be omitted if the method is ''void'') |`@returns{tab}description`                   |`@returns true or false depending on if the day has a y in it`
`@throws`  |Defines an exception that may be thrown by the method                             |`@throws{tab}exception type`                 |`@throws Framework::exception`

### Named args

As you can see, positional args/params are easy to handle - you can simply list them thus:
```
=head2 [void] myMethod( $age, $height, $name )

description ...

    @param  are    [number]   age of the person
    @param  height [number]   height of the person (cm)
    @param  name   [string]   name of the person

=cut
```
but what about the name args? use `@named` thus:
```
=head2 [void] myMethod( %arg )

description ...

    @named  age    [number]   age of the person
    @named  height [number]   height of the person (cm)
    @named  name   [string]   name of the person

=cut
```

### Param types

Each parameter (positional or named) has a type thus:

Type        |Description
------------|-------------
string      |A scalar string e.g. `"Stewie Griffin"`
number      |A numeric value e.g. `103`
array(T)    |A plain array where `T` is the type contained (may be any of the types listed here or “any” if mixed)
arrayref(T) |An array ref. `T` as per `array`
hash        |A plain hash
hashref     |A hash reference
object      |An object reference

Private methods
---------------

So what about private methods then?
“You said 'use normal comments' but surely there's some guidance?” Why yes, there is.
```
## [void] _myPrivateMethod($param1)
#
#   @param  param1   [string]   something we're passing in
#
sub _myPrivateMethod
{
...
}
```
Yup, it's still got the `@param` tags et al. but they don't get parsed by the generator. So why have them? Because it makes it more consistent when you're reading the source and ensures things are still documented.

Example
-------
```
package Animal::Mammal::Panda;

sub eat {
  my ($self, $food) = @_;

  if ($food eq 'bamboo') {
    $self->_masticate($food);
    return 'munch';
  }
  else {
    return 'yuk';
  }    
}

# ---------------------------------------------

## [void] _masticate( $food )
#
# Fully masticate the food supplied
#
#   @param   food    [string]   food to be processed
#
sub _masticate {
  my ($self, $food) = @_;
  ...
}

# =============================================

=head1 NAME

Animal::Mammal::Panda - a model class that describes the best animal ever

=head1 SYNOPSIS

  use Animal::Mammal::Panda;

  my $chiChi = Animal::Mammal::Panda->new();
  $chiChi->name( 'Chi Chi' );
  $chiChi->eat( 'bamboo' );

  if ($chiChi->canMate()) {
    $chichi->produceOffspring();
  }

=head1 DESCRIPTION

Model encompassing a Panda. Allows functionality to name and breed
from your panda. Will additionally create loads of revenue for
your C<zoo> instance.

You should use this class when you need a cute animal
for all occasions.

=head1 METHODS

=head2 [string] eat( $food )

Make the panda eat the given C<food>.

  @param   food   [string]   a type of food to be eaten (will be rejected if not bamboo)
  @returns munch or yuk

=cut
```
