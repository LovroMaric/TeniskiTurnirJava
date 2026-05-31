package Service;

import Model.User;
import Repository.UserRepository;

import java.util.Optional;

public class UserService {

    private final UserRepository repository = new UserRepository();

    public Optional<User> login(String username, String password) {

        return repository.login(username, password);
    }

    public void register(String username, String password) {

        repository.register(username, password);
    }
}