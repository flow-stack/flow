accessing
encodedSubject
	"Answers the subject of the email encoded (so it can support diacritics).
	Ref: solved to satisfy most email clients (including the infamous MS Outlook)
	http://stackoverflow.com/questions/7518024/php-email-sent-with-issues-on-subject-chars-in-outlook-only"

	^ self folded: self subject toUtf8 base64Encoded