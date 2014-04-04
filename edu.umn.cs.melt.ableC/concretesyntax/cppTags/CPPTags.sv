grammar edu:umn:cs:melt:ableC:concretesyntax:cppTags;

-- After the file name comes zero or more flags, which are `1', `2',
-- `3', or `4'.  If there are multiple flags, spaces separate them.  Here
-- is what the flags mean:

--`1'
--     This indicates the start of a new file.
synthesized attribute tagIsNewStart :: Boolean;

--`2'
--     This indicates returning to a file (after having included another
--     file).
synthesized attribute tagIsReturn :: Boolean;

--`3'
--     This indicates that the following text comes from a system header
--     file, so certain warnings should be suppressed.
synthesized attribute tagIsSystem :: Boolean;

--`4'
--     This indicates that the following text should be treated as being
--     wrapped in an implicit `extern "C"' block.
synthesized attribute tagIsExternC :: Boolean;

terminal Space_t /[\ ]+/;
terminal Hash_t '#';


-- I give up!
ignore terminal CPP_Location_Tag_t /\#\ [0-9]+\ \"[^\"]+\"[\ 0-9]*\n/
  action {
    filename = 
      substring(
        indexOf("\"", lexeme) + 1, -- after "
        lastIndexOf("\"", lexeme), -- end before "
        lexeme);
    line = toInt(
      substring(
        2, -- after #<space>
        indexOf("\"", lexeme) - 1, -- end before <space>"
        lexeme));
    column = 0;
  };

{-
terminal Newline_t /\n/;
terminal TagFilename_t /[\"]([^\"]|[\\][\"])*[\"]/;
terminal TagNumber_t /0|([1-9][0-9]*)/;
terminal TagFlag_t /[1234]/;

closed nonterminal TagLine_c with location;
closed nonterminal TagFlagSeq_c with location;

concrete production tagline_c
top::TagLine_c ::= h::Hash_t cpp_line::TagNumber_t cpp_filename::TagFilename_t cpp_flags::TagFlagSeq_c n::Newline_t
layout { Space_t }
{
}
action
{
  filename = substring(1,length(cpp_filename.lexeme) - 1,cpp_filename.lexeme);
  line = toInt(cpp_line.lexeme);
  column = 0;
}

concrete production tagflagseq_cons_c
top::TagFlagSeq_c ::= n::TagNumber_t rest::TagFlagSeq_c
layout { Space_t }
{
}

concrete production tagflagnil_c
top::TagFlagSeq_c ::=
layout { Space_t }
{
}
-}
