# quandl-stock-api
Provide the stock information for the given dates & stock

# Steps to run the apllication
1) Clone the repo and ```cd quandl-stock-api```
2) ```bundle``` - to install the require gems
3) ```mailcatcher``` - to check the mails in locally
4) Get the api from the quandl api doc eg: `8tREfmA_XXXXXXXXXX`
5) `rspec` is for unit test coverage
6) `rubycritic` will you the code quality report - mine (93.41/100)
7) Incorporate the rubocop for the code analyzer and formatter


# Sample
# Input : 
API_KEY=XXXX ruby stock.rb AAPL Jan 1 2018 - Jan 5 2018
# Output: 

02.01.18: Closed at 172.26 (169.26 ~ 172.3)

03.01.18: Closed at 172.23 (171.96 ~ 174.55)

04.01.18: Closed at 173.03 (172.08 ~ 173.47)

05.01.18: Closed at 175.0 (173.05 ~ 175.37)


First 3 Drawdowns: 
-1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18) 
-1.5% (174.55 on 03.01.18 -> 171.96 on 03.01.18) 
-1.3% (175.37 on 05.01.18 -> 173.05 on 05.01.18) 


Maximum drawdown: -1.8% (172.3 on 02.01.18 -> 169.26 on 02.01.18) 


Return: 2.740000000000009 [+1.6%] (172.26 on 02.01.18 -> 175.0 on 05.01.18) 
