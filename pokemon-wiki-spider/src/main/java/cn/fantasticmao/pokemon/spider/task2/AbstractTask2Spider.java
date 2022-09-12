package cn.fantasticmao.pokemon.spider.task2;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.concurrent.Callable;

/**
 * AbstractTask2Spider
 *
 * @author fantasticmao
 * @since 2018/8/14
 */
abstract class AbstractTask2Spider<T extends AbstractTask2Spider.Data> implements Callable<T> {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final String baseUrl;
    private final String suffix;

    protected AbstractTask2Spider(String baseUrl, String suffix) {
        this.baseUrl = baseUrl;
        this.suffix = suffix;
    }

    @Override
    public T call() {
        logger.info("request data... {}{}", baseUrl, suffix);
        Document document = requestData(baseUrl, suffix);

        logger.info("parse data... {}{}", baseUrl, suffix);
        return parseData(document);
    }

    /**
     * 请求数据
     */
    private Document requestData(String baseUrl, String suffix) {
        String url = StringUtils.isNoneBlank(suffix) ? baseUrl + suffix : baseUrl;
        for (; ; ) {
            try {
                return Jsoup.connect(url)
                    .maxBodySize(10 * 1024 * 1024)
                    .timeout(30_000)
                    .get();
            } catch (IOException e) {
                if (e instanceof HttpStatusException) {
                    HttpStatusException statusException = (HttpStatusException) e;
                    // 例如请求「https://wiki.52poke.com/zh-hans/究极无敌大冲撞（招式）」的 Status Code 是 404，
                    // 该资源的真实 URL 为「https://wiki.52poke.com/zh-hans/究极无敌大冲撞」
                    if (statusException.getStatusCode() == 404) {
                        url = baseUrl;
                    } else {
                        logger.error("request error, status code {} from {}",
                            statusException.getStatusCode(), url, e);
                    }
                } else if (e instanceof SocketTimeoutException) {
                    logger.info("request timeout, retrying... {}", url);
                } else {
                    logger.error("request error, retrying... {}", url, e);
                }
            }
        }
    }

    /**
     * 解析数据
     */
    protected abstract T parseData(Document document);

    interface Data {

    }
}
