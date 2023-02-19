package cn.fantasticmao.pokemon.web.repoistory.impl;

import cn.fantasticmao.pokemon.web.domain.Move;
import cn.fantasticmao.pokemon.web.repoistory.MoveDynamicRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.annotation.Nullable;
import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * MoveDynamicRepositoryImpl
 *
 * @author fantasticmao
 * @since 2023-02-19
 */
public class MoveDynamicRepositoryImpl implements MoveDynamicRepository {
    @Resource
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public List<Move> findByName(@Nullable String nameZh, @Nullable String nameEn) {
        if (StringUtils.isAllEmpty(nameZh, nameEn)) {
            return Collections.emptyList();
        }

        Map<String, Object> paramMap = new HashMap<>();
        String sql = "SELECT * FROM t_move " +
            "WHERE 1 = 1 ";
        if (StringUtils.isNotEmpty(nameZh)) {
            sql += "AND name_zh LIKE '%' || :nameZh || '%' ";
            paramMap.put("nameZh", nameZh);
        }
        if (StringUtils.isNotEmpty(nameEn)) {
            sql += "AND name_en LIKE '%' || :nameEn || '%' ";
            paramMap.put("nameEn", nameEn);
        }
        return namedParameterJdbcTemplate.query(sql, paramMap,
            new BeanPropertyRowMapper<>(Move.class));
    }
}
