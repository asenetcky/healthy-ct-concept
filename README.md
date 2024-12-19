# Healthy Connecticut 20XX Concept

## Motivation

Connecticut State Health Assessments (SHA) are wonderful tools for presenting a
snapshot of the champions, challenges and overall health of the state.  The
process of putting together a SHA is also a gargantuan undertaking.  Building
the document itself is equally large and the process is likely a manual slog.
I say likely, because I don't know how it was built.

- Wouldn't it be great to have some insight into how it was built?
- Wouldn't it be great if the process of putting the document together and 
deploying to a website and multiple formats was as easy as one command?
- Wouldn't be great if the publication wasn't *only* an enormous pdf, but 
a webpage with useful interactions, like a search bar and pop-ups on hover?
- Wouldn't it be great if this was developed out in the open, with open data?
- Wouldn't it be great if there was infrastructure in place to reproduce a
version of the SHA that could be run every year?

I would love to ship the ideal I was hinting at above. I'm not entirely sure
it could ever happen, but I'd like to think so.  So I'm going to mock up a 
concept using random open data from the 
[CT Open Data Portal](https://data.ct.gov/) and snippets from the [previous
SHA](https://portal.ct.gov/dph/state-health-planning/healthy-connecticut/-/media/departments-and-agencies/dph/dph/state_health_planning/sha-ship/hct2025/ct_sha_report_final0605-2020.pdf)
and showcase what the SHA can be! 

The SHA is always going to be a larger undertaking, and I am *not* out to
besmirch previous efforts. I think they are wonderful documents, however, I
think the build and deploy process like has some rough edges that could be
smoothed away without using tax dollars.  I also believe by making it more open
and transparent for the public it becomes a much better, more user-friendly
product and it will literally be easier to recreate for CT DPH staff and
contributors.

## Toolkit

This will be built with the following core tools:

- R v4.4.2 (see `renv.lock` for packages)
- [RStudio 2024.12.0 Build 467](https://posit.co/products/open-source/rstudio/)
- [Quarto v1.6.39](https://quarto.org/)
- [git](https://git-scm.com/) 
- [github](https://github.com/)
- [zotero](https://www.zotero.org/)

I also want to highlight some other tools that aren't core to this project, but
I use them and enjoy using them and I want to highlight them:

- [Neovim v0.11.0-dev](https://neovim.io/)
- [LazyVim](https://www.lazyvim.org/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [lazygit](https://github.com/jesseduffield/lazygit)