package Service;

import Model.Tournament;
import Repository.TournamentRepository;

import java.util.List;

public class TournamentService {

    private final TournamentRepository repository;

    public TournamentService(TournamentRepository repository) {
        this.repository = repository;
    }

    public void add(Tournament tournament) {
        repository.save(tournament);
    }

    public List<Tournament> findAll() {
        return repository.findAll();
    }

    public void update(Tournament tournament) {
        repository.update(tournament);
    }

    public void delete(Long id) {
        repository.delete(id);
    }

    public void addPlayerToTournament(Long tournamentId, Long playerId, String result) {
        repository.addPlayerToTournament(tournamentId, playerId, result);
    }
}

