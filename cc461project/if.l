%%
if			return IF ;
else			return ELSE ;
"("			return OP ;
")"			return CL ;
"{"			return OB ;
"}"			return CB ;
eq			return EQUAL ;
ma			return MAYOR ;
me			return MENOR ;
[0-9]+			return NUM ;
[a-z]+			return ID ;
"="			return IG ;
%%
