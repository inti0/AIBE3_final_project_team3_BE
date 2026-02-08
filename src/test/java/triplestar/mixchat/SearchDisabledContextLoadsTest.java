package triplestar.mixchat;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * Elasticsearch(검색 기능) 없이도 애플리케이션이 부팅되는지 확인하는 최소 회귀 테스트.
 */
@ActiveProfiles("test")
@SpringBootTest(properties = {
        "mixchat.search.enabled=false",
        "spring.data.elasticsearch.repositories.enabled=false",
        "spring.data.elasticsearch.auto-index-creation=false"
})
class SearchDisabledContextLoadsTest {

    @Test
    void contextLoads_whenSearchDisabled() {
        // context load assertion
    }
}
