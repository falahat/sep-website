


class TextObject(object):

	def __init__(self):
		self.children = [];
		self.dependencies = [];

		self.parent = None;
		self.order = None;

		self.depth = self.__class__.t_type;;
		self.t_type = self.__class__.t_type;
		self.parent_type = self.__class__.parent_type; # For Proposition should be Part

class Book(TextObject):
	t_type = "BOOK"
	depth = 0;
	parent_type = None

class Part(TextObject):
	t_type = "PART"
	depth = 1;
	parent_type = "BOOK"

class Definition(TextObject):
	t_type = "DEFINITION"
	depth = 2
	parent_type = "PART"

class Axiom(TextObject):
	t_type = "AXIOM"
	depth = 2
	parent_type = "PART"

class Proposition(TextObject):
	t_type = "PROPOSITION"
	depth = 2
	parent_type = "PART"

class Proof(TextObject):
	t_type = "PROOF"
	depth = 3
	parent_type = "PROPOSITION"

class Corollary(TextObject):
	t_type = "COROLLARY"
	depth = 3
	parent_type = "PROPOSITION"

class Note(TextObject):
	t_type = "NOTE"
	depth = 3
	parent_type = "PROPOSITION"

t_type_classes = {"BOOK":Book, "PART":Part, "DEFINITION":Definition, \
"AXIOM":Axiom, "PROPOSITION":Proposition, "PROOF":Proof, "COROLLARY":Corollary, "NOTE":Note};



def create_from_type(t_type):
	if t_type in t_type_classes:
		ans = t_type_classes[t_type]();
		return ans;
	else:
		return None

import html.parser;

class MyHTMLParser(HTMLParser):
    # def handle_starttag(self, tag, attrs):
    #     print "Encountered a start tag:", tag
    # def handle_endtag(self, tag):
    #     print "Encountered an end tag :", tag
    def handle_data(self, data):
        print "Encountered some data  :", data


# instantiate the parser and fed it some HTML
parser = MyHTMLParser()
parser.feed('<html><head><title>Test</title></head>'
            '<body><h1>Parse me!</h1></body></html>')

