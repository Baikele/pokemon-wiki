package cn.fantasticmao.pokemon.wiki.repoistory;

import cn.fantasticmao.pokemon.SpringTest;
import cn.fantasticmao.pokemon.wiki.domain.PokemonBaseStat;
import org.junit.Assert;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * PokemonBaseStatRepositoryTest
 *
 * @author maodh
 * @since 2018/8/5
 */
public class PokemonBaseStatRepositoryTest extends SpringTest {
    @Resource
    private PokemonBaseStatRepository pokemonBaseStatRepository;

    @Test
    public void findByNameZh() {
        List<PokemonBaseStat> pokemonBaseStatList = pokemonBaseStatRepository.findByNameZh("妙蛙种子");
        Assert.assertNotNull(pokemonBaseStatList);
        System.out.println(pokemonBaseStatList);
    }
}