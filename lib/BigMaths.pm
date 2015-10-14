package BigMaths;
use Dancer2;

use BigMaths::Questions;

our $VERSION = '0.1';

get '/' => sub {

	my $level = params->{level} || 6;

	my $questions = BigMaths::Questions->new( level => $level );

    template 'index', {
    	questions => $questions->new_questions(params->{questions} || 20)
    };
};

true;
