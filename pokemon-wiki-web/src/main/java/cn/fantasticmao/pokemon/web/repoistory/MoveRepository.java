package cn.fantasticmao.pokemon.web.repoistory;

import cn.fantasticmao.pokemon.web.domain.Move;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * MoveRepository
 *
 * @author fantasticmao
 * @since 2018/8/5
 */
public interface MoveRepository extends PagingAndSortingRepository<Move, Integer> {

    @Query(value = "SELECT * FROM pw_move WHERE nameZh LIKE '%' || ?1 || '%'", nativeQuery = true)
    List<Move> findByNameZh(String nameZh);

    @Query(value = "SELECT * FROM pw_move LIMIT ?2 OFFSET ?1", nativeQuery = true)
    List<Move> find(int offset, int limit);
}
