package com.hector.lookify.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hector.lookify.models.Song;
import com.hector.lookify.services.SongService;

@Controller
public class LookifyController {
	private final SongService songService;

	public LookifyController(SongService songService) {
		this.songService = songService;
	}

	@RequestMapping("/")
	public String index() {

		return "lookify/index.jsp";
	}

	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> allSongs = songService.allSongs();
		model.addAttribute("allSongs", allSongs);
		return "lookify/dashboard.jsp";
	}

	@GetMapping("/search")
	public String search(@RequestParam("artistName") String name, Model model) {

		List<Song> songs = songService.findSongByArtist(name);
		model.addAttribute("songs", songs);
		return "lookify/showArtist.jsp";
	}
	
	@GetMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> allSongs = songService.findTopTen();
		if(allSongs.size() < 11) {
			model.addAttribute("topTen", allSongs);
		} else {
			ArrayList<Song> topTen = new ArrayList<Song>();
			for(int i = 0; i < 10; i++) {
				topTen.add(allSongs.get(i));
			}
			model.addAttribute("topTen", topTen);
		}
		return "lookify/topTen.jsp";
			
	}

	@RequestMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song song, Model model) {
		ArrayList<Integer> r = new ArrayList<Integer>();
		for (int i = 1; i < 11; i++) {
			r.add(i);
		}
		model.addAttribute("ratingRange", r);
		return "lookify/newSong.jsp";
	}

	@RequestMapping("/songs/action_new")
	public String actionNewSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "/lookify/newSong.jsp";
		} else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/songs/{id}")
	public String showSong(@PathVariable("id") Long id, Model model) {
		Song s = songService.findSong(id);
		model.addAttribute("song", s);
		return "lookify/showSong.jsp";
	}

	@RequestMapping("/delete/{id}")
	public String deletSong(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
}
