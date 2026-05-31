//package Service;
//
//import Model.Player;
//import Repository.PlayerRepository;
//
//import java.util.List;
//
//public class PlayerService {
//
//    private final PlayerRepository repository = new PlayerRepository();
//
//    public void save(Player player) {
//        repository.save(player);
//    }
//
//    public List<Player> findAll() {
//        return repository.findAll();
//    }
//}

package Service;

import Model.Player;
import Repository.PlayerRepository;

import java.util.List;

public class PlayerService {

    private final PlayerRepository repo;

    public PlayerService(PlayerRepository repo) {
        this.repo = repo;
    }

    public List<Player> findAll() {
        return repo.findAll();
    }

    public void save(Player p) {
        repo.save(p);
    }

    public void update(Player p) {
        repo.update(p);
    }

    public void delete(Long id) {
        repo.delete(id);
    }
}
