package com.hector.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hector.lookify.models.Song;
import com.hector.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepository;

	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}

	public List<Song> allSongs() {
		return songRepository.findAll();
	}

	// creates a song
	public Song createSong(Song s) {
		return songRepository.save(s);
	}

//	Retrieves a song
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		if (optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}

	public List<Song> findSongByArtist(String name) {
		List<Song> songs = songRepository.findByArtist(name);
		return songs;
	}
	
	public List<Song> findTopTen(){
		return songRepository.findByOrderByRatingDesc();
	}
	
	public void deleteSong(Long id) {
		Song s = findSong(id);
		songRepository.delete(s);
	}
}
