package Repository;

import Model.*;
import Util.DBUtil;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TournamentRepository {

    public void save(Tournament tournament) {

        String sql = """
                INSERT INTO tournament
                (
                    name,
                    founded_year,
                    prize_money,
                    surface,
                    image_path,
                    country_id,
                    category_id
                )
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            stmt.setString(1, tournament.getName());

            stmt.setInt(2, tournament.getFoundedYear());

            stmt.setBigDecimal(3, tournament.getPrizeMoney());

            stmt.setString(4, tournament.getSurface().name());

            stmt.setString(5, tournament.getImagePath());

            stmt.setLong(6, tournament.getCountry().getId());

            stmt.setLong(7, tournament.getCategory().getId());

            stmt.executeUpdate();

            System.out.println("TOURNAMENT SAVED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Tournament> findAll() {

        List<Tournament> tournaments = new ArrayList<>();

        String sql = """
                SELECT
                    t.id,
                    t.name,
                    t.founded_year,
                    t.prize_money,
                    t.surface,
                    t.image_path,

                    c.id AS country_id,
                    c.name AS country_name,

                    cat.id AS category_id,
                    cat.name AS category_name

                FROM tournament t

                JOIN country c
                    ON t.country_id = c.id

                JOIN category cat
                    ON t.category_id = cat.id

                ORDER BY t.id
                """;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()
        ) {

            while (rs.next()) {

                Country country = new Country(
                        rs.getLong("country_id"),
                        rs.getString("country_name")
                );

                Category category = new Category(
                        rs.getLong("category_id"),
                        rs.getString("category_name")
                );

                Tournament tournament = new Tournament(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getInt("founded_year"),
                        rs.getBigDecimal("prize_money"),
                        SurfaceType.valueOf(
                                rs.getString("surface")
                        ),
                        rs.getString("image_path"),
                        country,
                        category,
                        new ArrayList<>(),
                        new ArrayList<>()
                );

                tournaments.add(tournament);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tournaments;
    }

    // =====================================================
    // UPDATE
    // =====================================================

    public void update(Tournament tournament) {

        String sql = """
                UPDATE tournament
                SET
                    name = ?,
                    founded_year = ?,
                    prize_money = ?,
                    surface = ?,
                    image_path = ?,
                    country_id = ?,
                    category_id = ?
                WHERE id = ?
                """;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            stmt.setString(1, tournament.getName());

            stmt.setInt(2, tournament.getFoundedYear());

            stmt.setBigDecimal(3, tournament.getPrizeMoney());

            stmt.setString(4, tournament.getSurface().name());

            stmt.setString(5, tournament.getImagePath());

            stmt.setLong(6, tournament.getCountry().getId());

            stmt.setLong(7, tournament.getCategory().getId());

            stmt.setLong(8, tournament.getId());

            stmt.executeUpdate();

            System.out.println("TOURNAMENT UPDATED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =====================================================
    // DELETE
    // =====================================================

    public void delete(Long id) {

        String sql = """
                DELETE FROM tournament
                WHERE id = ?
                """;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            stmt.setLong(1, id);

            stmt.executeUpdate();

            System.out.println("TOURNAMENT DELETED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =====================================================
    // DRAG & DROP RELATION
    // =====================================================

    public void addPlayerToTournament(Long tournamentId, Long playerId, String result) {

        String sql = """
        INSERT INTO tournament_player (tournament_id, player_id, result)
        VALUES (?, ?, ?)
        """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, tournamentId);
            stmt.setLong(2, playerId);
            stmt.setString(3, result);

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
