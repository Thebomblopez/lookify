package com.hector.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hector.lookify.models.Song;



public interface SongRepository extends CrudRepository<Song, Long>{
	List<Song> findAll();
	List<Song> findByArtist(String name);
	List<Song> findByOrderByRatingDesc();
}
