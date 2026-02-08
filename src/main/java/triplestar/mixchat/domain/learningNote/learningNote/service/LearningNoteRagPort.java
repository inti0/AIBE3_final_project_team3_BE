package triplestar.mixchat.domain.learningNote.learningNote.service;

import java.util.List;
import triplestar.mixchat.domain.learningNote.learningNote.entity.LearningNote;

/**
 * RAG 기반 학습노트 컨텍스트 제공 기능.
 * Elasticsearch 사용 여부에 따라 구현체가 달라질 수 있습니다.
 */
public interface LearningNoteRagPort {
    void saveByRecentNotes(Long roomId, Long memberId);

    List<LearningNote> loadNotesFromCache(Long roomId, Long memberId);
}
