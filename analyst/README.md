In this case i worked on USA election 2012 database, which contains data about donate, donators and some other interesting things.
To made the analysis more clear and understable, I splitted them on some steps. Every step you can see in election_donate_usa.ipynb.

Step 1. Loading data and looking closer on them. We don't have any null values. 
Step 2. Get the candidates by unique function. Now we can make new category 'parties'. By map we creating new column.
Step 3. Checking for refund, and delete them from our data.
Step 4. Merge names of the same profession
Step 5. Aggregate data by profession and parties. Print only donators which donate more than 2 000 000.
Step 6. Splitting data for bins by cut func.
Step 7. Aggregate data by candidates and states.

Conclusion: After analysis I discovered some interesting facts. One of them is that in 2012 election only two candidates mattered.
            Looking on data by profession, we find out that lawyers preffered to donate Democrates campaign while investors chose Republicans.
            Another fact is that the biggest group that donated Barack Obama in his campaign were self-employed and retired. 
            Big comapnies such as Goldman Sachs financed Mitt Romney. Most of the small, individual donations contributed Obamas campaign.
            We also found out about distribution of support in USA. For example in DC Obama received 81% of all donations.


Python 3.9.0
Numpy  1.18.4
Matplotlib 3.2.1
Pandas 1.1.2