# Discogs

This is a re-implementation in Phoenix on a graphical front-end to a PostGresQL database which contains a subset of the data from my collection of music which is held at discogs.com.

The full data set can be exported as a CSV file. I wrote a filter which reads the CSV file and extracts those fields which interest me at home, and does a little denormalisation of the data.

The CSV looks like ...

Catalog#,Artist,Title,Label,Format,Rating,Released,release_id,CollectionFolder,Date Added,Collection Media Condition,Collection Sleeve Condition,Collection Notes

OTO 2,Au Pairs,You,021 Records,"7"", EP",,1979,7530535,Uncategorized,2020-11-12 12:24:52,,,

"- oto - 4, oto4",Au Pairs,Diet / Its Obvious,"021 Records, Human Records (2)","7"", Single, Pap",,1980,434828,Uncategorized,2020-11-12 12:26:02,,,

TENR 137,Mantronix,Who Is It?,10 Records,"12""",,1987,129186,Uncategorized,2020-03-09 22:40:50,Very Good Plus (VG+),Very Good Plus (VG+),

VP 4121,Barrington Levy,Teach The Youth: Barrington Levy & Friends At Joe Gibbs 1980+85,17 North Parade,"CD, Comp",,2008,1408560,Uncategorized,2021-05-04 12:10:41,Near Mint (NM or M-),Near Mint (NM or M-),

VP 4123,Cocoa Tea,The Sweet Sound Of Cocoa Tea,17 North Parade,"2xCD, Comp",,2008,1952156,Uncategorized,2021-04-06 11:25:59,Near Mint (NM or M-),Near Mint (NM or M-),

That code is currently at https://github.com/bobblestiltskin/music/blob/main/music/csv_read.py - I guess for completeness I should port that to elixir as an exercise too ...

Anyhow, we keep the items in a table, linked against the artist, label and formats and denormalise these fields. I just wanted to learn and I had quite a bit of data.

The original code was written in django (when I wanted to learn that). I have both retained and improved the functionality of the elixir version (particularly with regard to formats). I keep all of the 12" singles together - I do not *much* care about the difference between remastered green vinyl ones and standard black vinyl. Discogs does - but now I have radio buttons to match all formats of a particular type which is much better for my purposes.

# A caveat.

I developed the code on my unstable debian machine - with 

bob@portugal:~$ elixir --version
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Elixir 1.12.2 (compiled with Erlang/OTP 24)
bob@portugal:~$ 

And then installed on my internet-accessible mailserver (running debian stable) but that fails to run with 

iex -S mix
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

==> gettext
Compiling 1 file (.yrl)
/usr/lib/erlang/lib/parsetools-2.2/include/yeccpre.hrl: no such file or directory
could not compile dependency :gettext, "mix compile" failed. You can recompile this dependency with "mix deps.compile gettext", update it with "mix deps.update gettext" or clean it with "mix deps.clean gettext"

I *believe* that this is caused by version incompatibility since there I have

bob@ks3353085:~/src/discogs$ elixir --version
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Elixir 1.10.3 (compiled with Erlang/OTP 22)
bob@ks3353085:~/src/discogs$ 

I could upgrade elixir, but ...

So, the code works on the latest elixir. I *may* try to get it to work elsewhere. I want to understand better before I do.
