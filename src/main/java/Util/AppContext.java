package Util;

import Repository.*;
import Service.*;

public class AppContext {

    private static final PlayerRepository playerRepository = new PlayerRepository();

    private static final CountryRepository countryRepository = new CountryRepository();

    private static final TournamentRepository tournamentRepository = new TournamentRepository();

    private static final PlayerService playerService = new PlayerService(playerRepository);

    private static final CountryService countryService = new CountryService(countryRepository);

    private static final TournamentService tournamentService = new TournamentService(tournamentRepository);

    private static final CategoryRepository categoryRepository = new CategoryRepository();

    private static final CategoryService categoryService = new CategoryService(categoryRepository);

    public static PlayerService getPlayerService() {
        return playerService;
    }

    public static CountryService getCountryService() {
        return countryService;
    }

    public static TournamentService getTournamentService() {
        return tournamentService;
    }
    public static CategoryService getCategoryService() {
        return categoryService;
    }
}