package triplestar.mixchat.domain.learningNote.learningNote.service;

import java.util.List;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;
import triplestar.mixchat.domain.learningNote.learningNote.entity.LearningNote;

@Service
@ConditionalOnProperty(prefix = "mixchat.search", name = "enabled", havingValue = "false")
public class LearningNoteRagNoopService implements LearningNoteRagPort {

    @Override
    public void saveByRecentNotes(Long roomId, Long memberId) {
        // no-op
    }

    @Override
    public List<LearningNote> loadNotesFromCache(Long roomId, Long memberId) {
        return List.of();
    }
}
