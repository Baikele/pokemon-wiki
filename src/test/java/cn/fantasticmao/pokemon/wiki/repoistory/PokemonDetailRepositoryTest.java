package cn.fantasticmao.pokemon.wiki.repoistory;

import cn.fantasticmao.pokemon.SpringTest;
import cn.fantasticmao.pokemon.wiki.domain.PokemonDetail;
import org.junit.Assert;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * PokemonDetailRepositoryTest
 *
 * @author maodh
 * @since 2018/8/29
 */
public class PokemonDetailRepositoryTest extends SpringTest {
    @Resource
    private PokemonDetailRepository pokemonDetailRepository;

    @Test
    public void findByNameZh() {
        List<PokemonDetail> pokemonDetailList = pokemonDetailRepository.findByNameZh("妙蛙种子");
        Assert.assertNotNull(pokemonDetailList);
        System.out.println(pokemonDetailList);
    }

    @Test
    public void findByIdIn() {
        List<PokemonDetail> pokemonDetailList = pokemonDetailRepository.findByIdIn(Arrays.asList(1, 2));
        Assert.assertNotNull(pokemonDetailList);
        System.out.println(pokemonDetailList);
    }

}