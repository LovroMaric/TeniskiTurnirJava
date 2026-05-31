package Model;

import java.util.Objects;

public class TournamentPlayer {

    private Long id;

    private Tournament tournament;
    private Player player;

    private String result;

    public TournamentPlayer(Long id, Tournament tournament, Player player, String result) {
        this.id = id;
        this.tournament = tournament;
        this.player = player;
        this.result = result;
    }


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Tournament getTournament() { return tournament; }
    public void setTournament(Tournament tournament) { this.tournament = tournament; }

    public Player getPlayer() { return player; }
    public void setPlayer(Player player) { this.player = player; }

    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TournamentPlayer)) return false;
        TournamentPlayer that = (TournamentPlayer) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }


    @Override
    public String toString() {
        return player.getFullName() + " - " + result;
    }
}
