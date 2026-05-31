package Repository;

import Model.Country;
import Model.Player;
import Util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerRepository {

    public void save(Player player) {

        String sql = """
                INSERT INTO player
                (
                    first_name,
                    last_name,
                    ranking,
                    image_path,
                    country_id
                )
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, player.getFirstName());
            stmt.setString(2, player.getLastName());
            stmt.setInt(3, player.getRanking());
            stmt.setString(4, player.getImagePath());

            if (player.getCountry() != null) {
                stmt.setLong(5, player.getCountry().getId());
            } else {
                stmt.setNull(5, Types.BIGINT);
            }

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Player> findAll() {

        List<Player> players = new ArrayList<>();

        String sql = """
                SELECT
                    p.id,
                    p.first_name,
                    p.last_name,
                    p.ranking,
                    p.image_path,

                    c.id AS country_id,
                    c.name AS country_name

                FROM player p
                LEFT JOIN country c ON p.country_id = c.id
                ORDER BY p.id
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Country country = null;

                if (rs.getObject("country_id") != null) {
                    country = new Country(rs.getLong("country_id"), rs.getString("country_name"));
                }

                Player player = new Player(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name"), rs.getInt("ranking"), rs.getString("image_path"));

                player.setCountry(country);

                players.add(player);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return players;
    }

    public void update(Player player) {

        String sql = """
                UPDATE player
                SET
                    first_name = ?,
                    last_name = ?,
                    ranking = ?,
                    image_path = ?,
                    country_id = ?
                WHERE id = ?
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, player.getFirstName());
            stmt.setString(2, player.getLastName());
            stmt.setInt(3, player.getRanking());
            stmt.setString(4, player.getImagePath());

            if (player.getCountry() != null) {
                stmt.setLong(5, player.getCountry().getId());
            } else {
                stmt.setNull(5, Types.BIGINT);
            }

            stmt.setLong(6, player.getId());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(Long id) {

        String sql = """
                DELETE FROM player
                WHERE id = ?
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}