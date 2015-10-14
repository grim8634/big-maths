package BigMaths::Questions;
use Moo;

has level => (
	is			=> 'rw',
	required 	=> 1,
);

sub new_questions {
	my ( $self, $count ) = @_;

	my @questions;
	my $types_max = $self->_get_types_max;

	while ( $count-- > 0 ) {
		my $type = int(rand($types_max)); #Need to do something with level to include multiplications, additions etc.
		if ( $type == 0 ) {
			push @questions, $self->new_addition;
		} 
		elsif ( $type == 1 ) {
			push @questions, $self->new_subtraction;	
		} 
		elsif ( $type == 2 ) {
			push @questions, $self->new_multiplication;	
		}
		elsif ( $type == 3 ) {
			push @questions, $self->new_division;	
		} 
	}

	return \@questions;
}

sub new_multiplication {
	my $self = shift;

	my $x = int(rand($self->_max_number));
	my $y = int(rand($self->_max_number));

	return { x => $x, y => $y, a => $x * $y, operator => 'x' };
}

sub new_division {

}

sub new_addition {
	my $self = shift;

	my $x = int(rand($self->_max_number));
	my $y = int(rand($self->_max_number));

	return { x => $x, y => $y, a => $x + $y, operator => '+' };
}

sub new_subtraction {
	my $self = shift;

	my $x = int(rand($self->_max_number));
	my $y = int(rand($self->_max_number));

	if( $y > $x ) { #No negative ansers
		my $tmp = $x;
		$x = $y;
		$y = $tmp;
	}

	return { x => $x, y => $y, a => $x - $y, operator => '-' };
}

sub _max_number {
	my $self = shift;
	return 10 if $self->level < 8;
	return 12 if $self->level < 9;
	return 20;
}

sub _get_types_max {
	my $self = shift;

	my $types_max = 1;
	
	$types_max = 2 
		if( $self->level > 1 );
	
	$types_max = 3
		if( $self->level > 5 );

	$types_max = 4
		if( $self->level > 6 );

	return $types_max;
}

1;
