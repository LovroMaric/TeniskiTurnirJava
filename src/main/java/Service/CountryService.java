package Service;

import Model.Country;
import Repository.CountryRepository;

import java.util.List;

public class CountryService {

    private final CountryRepository repo;

    public CountryService(CountryRepository repo) {
        this.repo = repo;
    }

    public List<Country> findAll() {
        return repo.findAll();
    }
}