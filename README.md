# Discogs

This is a re-implementation in Phoenix on a graphical front-end to a PostGresQL database which contains a subset of the data from my collection of music which is held at discogs.com.

The full data set can be exported as a CSV file. I wrote a filter which reads the CSV file and extracts those fields which interest me at home, and does a little denormalisation of the data.

The search page presents an interface like :

![Image](discogs_elixir.png?raw=true)


The CSV looks like ...
```
Catalog#,Artist,Title,Label,Format,Rating,Released,release_id,CollectionFolder,Date Added,Collection Media Condition,Collection Sleeve Condition,Collection Notes
OTO 2,Au Pairs,You,021 Records,"7"", EP",,1979,7530535,Uncategorized,2020-11-12 12:24:52,,
"- oto - 4, oto4",Au Pairs,Diet / Its Obvious,"021 Records, Human Records (2)","7"", Single, Pap",,1980,434828,Uncategorized,2020-11-12 12:26:02,,,
TENR 137,Mantronix,Who Is It?,10 Records,"12""",,1987,129186,Uncategorized,2020-03-09 22:40:50,Very Good Plus (VG+),Very Good Plus (VG+),
VP 4121,Barrington Levy,Teach The Youth: Barrington Levy & Friends At Joe Gibbs 1980+85,17 North Parade,"CD, Comp",,2008,1408560,Uncategorized,2021-05-04 12:10:41,Near Mint (NM or M-),Near Mint (NM or M-)
VP 4123,Cocoa Tea,The Sweet Sound Of Cocoa Tea,17 North Parade,"2xCD, Comp",,2008,1952156,Uncategorized,2021-04-06 11:25:59,Near Mint (NM or M-),Near Mint (NM or M-),
```

The code to convert the csv into normalised tables is currently at https://github.com/bobblestiltskin/music/blob/main/music/csv_read.py - I guess for completeness I should port that to elixir as an exercise too ...

The original code was written in python and runs under django (when I wanted to learn that) and looks like :

![Image](https://github.com/bobblestiltskin/music/blob/main/music/python_discogs.png?raw=true)

I have both retained and improved the functionality of the elixir version (particularly with regard to formats). I keep all of the 12" singles together - I do not *much* care about the difference between remastered green vinyl ones and standard black vinyl. Discogs does - but now I have radio buttons to match all formats of a particular type which is much better for my purposes.

I added some code to sort the output of the find page by Artist name and title (as seen in the CSV - it comes from discogs ordered by label, by default). I was surprised how little time it took me to implement - maybe 2 hours in total!
