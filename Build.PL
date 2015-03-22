use strict;
use warnings;

use 5.008_001; # For the utf-8 stuff.

use Module::Build;

# -----------------------------------------------

my $class = Module::Build->subclass(code => <<'EOF');

sub ACTION_authortest
{
	my($self) = @_;

	$self->depends_on('build');
	$self->depends_on('manifest');
	$self->depends_on('distmeta');

	$self->test_files( qw< t xt/author > );
	$self->recursive_test_files(1);

	$self->depends_on('test');

	return;
}
EOF

$class -> new
(
	module_name    => 'Tree::DAG_Node',
	license        => 'artistic_2',
	dist_abstract  => 'An N-ary tree',
	dist_author    => 'Sean M. Burke <sburke@cpan.org>',
	build_requires =>
	{
		'Test::More' => 1.001014,
		'Test::Pod' => 1.48,
	},
	configure_requires =>
	{
		'Module::Build' => 0.4211,
	},
	meta_merge =>
	{
		resources =>
		{
			repository => 'https://github.com/ronsavage/Tree-DAG_Node',
		},
	},
	requires =>
	{
		'File::Spec' => 3.40,
		'File::Temp' => 0.19,
		'File::Slurp::Tiny' => 0.003,
		'strict' => 0,
		'warnings' => 0,
	},
	resources =>
	{
		bugtracker => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Tree-DAG_Node',
		license => 'http://opensource.org/licenses/Artistic-2.0',
	},
) -> create_build_script();
