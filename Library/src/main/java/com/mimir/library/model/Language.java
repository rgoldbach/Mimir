package com.mimir.library.model;

import com.mimir.library.enums.LanguageName;

public class Language {

		private LanguageName language;
		
		public Language(LanguageName language){
			this.language = language;
		}

		public LanguageName getLanguage() {
			return language;
		}

		public void setLanguage(LanguageName language) {
			this.language = language;
		}
}
