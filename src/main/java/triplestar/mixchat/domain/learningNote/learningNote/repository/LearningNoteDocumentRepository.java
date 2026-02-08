package triplestar.mixchat.domain.learningNote.learningNote.repository;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import triplestar.mixchat.domain.learningNote.learningNote.document.LearningNoteDocument;

@ConditionalOnProperty(prefix = "mixchat.search", name = "enabled", havingValue = "true", matchIfMissing = true)
public interface LearningNoteDocumentRepository extends ElasticsearchRepository<LearningNoteDocument, Long>,
        LearningNoteKnnSearchRepository {
}