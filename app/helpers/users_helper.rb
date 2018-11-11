module UsersHelper	
	def avatar_for(user)
		if user.avatar.nil?
			image_tag("Bionik1.jpeg", size: "328x370", alt: "Photo")
		else
			image_tag(user.avatar, size: "328x370", alt: "Photo")
		end
	end

	def min_avatar_for(user)
		if user.avatar.nil?
			image_tag("Bionik1.jpeg", size: "60x68", alt: "Photo")
		else
			image_tag(user.avatar, size: "60x68", alt: "Photo")
		end
	end
end
