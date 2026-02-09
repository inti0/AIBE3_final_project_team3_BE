package triplestar.mixchat.domain.learningNote.learningNote.embedding.operation;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import triplestar.mixchat.domain.learningNote.learningNote.entity.LearningNote;
import triplestar.mixchat.domain.learningNote.learningNote.repository.LearningNoteRepository;
import triplestar.mixchat.domain.learningNote.learningNote.service.LearningNoteEmbeddingService;

@Service
@RequiredArgsConstructor
public class EmbeddingOperationService {

    private final LearningNoteRepository learningNoteRepository;

    @Autowired(required = false)
    private LearningNoteEmbeddingService embeddingService;

    @Transactional
    public int regenerateAllLearningNoteEmbeddings() {
        List<LearningNote> notes = learningNoteRepository.findAllWithFeedbacks();

        if (embeddingService == null) {
            return 0;
        }

        int count = 0;
        for (LearningNote note : notes) {
            embeddingService.index(note);
            count++;
        }
        return count;
    }
}