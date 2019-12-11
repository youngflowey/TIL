import webbrowser


# webbrowser.open('https://naver.com')

# https://search.naver.com/search.naver?query=방탄소년단 # ? 이후를 query string이라 함

artists = ['민수','백예린','방탄소년단']
for artist in artists:
    webbrowser.open('https://search.naver.com/search.naver?query=' + artist)
