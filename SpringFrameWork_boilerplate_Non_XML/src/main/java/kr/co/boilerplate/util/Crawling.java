package kr.co.boilerplate.util;

import kr.co.boilerplate.domain.News;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Crawling {
    private final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";
    public List<News> getNews() throws IOException {
        List<News> list = new ArrayList<>();
        Connection conn = Jsoup.connect("http://news.naver.com")
                .header("Content-Type", "application/json;charset=UTF-8")
                .userAgent(USER_AGENT)
                .method(Connection.Method.GET)
                .ignoreContentType(true);
        Document doc = conn.get();
        Elements titles = doc.select(".comp_journal_subscribe .cjs_ctw .channel");
        Elements imgs = doc.select(".comp_journal_subscribe .cjs_news_mw img");
        Elements contents = doc.select(".comp_journal_subscribe .cjs_news_tw .cjs_t");
        for (int i = 0; i < 5; i++) {
            Element title = titles.get(i);
            Element img = imgs.get(i);
            Element content = contents.get(i);
            String titleStr = title.text();
            String imgSrc = img.attr("src");
            String contentStr = content.text();
            News dto = new News(titleStr, imgSrc, contentStr);
            list.add(dto);
        }
        for(News news:list){
            System.out.println(news.toString());
        }
        return list;
    }
}
