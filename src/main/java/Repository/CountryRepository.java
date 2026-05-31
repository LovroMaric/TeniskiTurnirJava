package Repository;

import Model.Country;
import Util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryRepository {

    public void save(Country country) {

        String sql = """
                INSERT INTO country (name)
                VALUES (?)
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, country.getName());
            stmt.executeUpdate();

            System.out.println("COUNTRY SAVED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Country> findAll() {

        List<Country> countries = new ArrayList<>();

        String sql = """
                SELECT id, name
                FROM country
                ORDER BY id
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Country country = new Country(rs.getLong("id"), rs.getString("name"));

                countries.add(country);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return countries;
    }

    public void update(Country country) {

        String sql = """
                UPDATE country
                SET name = ?
                WHERE id = ?
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, country.getName());
            stmt.setLong(2, country.getId());

            stmt.executeUpdate();

            System.out.println("COUNTRY UPDATED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(Long id) {

        String sql = """
                DELETE FROM country
                WHERE id = ?
                """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            stmt.executeUpdate();

            System.out.println("COUNTRY DELETED!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}