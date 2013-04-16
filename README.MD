<img src="http://scarcecapital.com/assets/hft-blue.png" width="100px">

[Blog](http://scarcecapital.com/hft)

hft is a small project with a big ambition. We aim to build the worlds best
algorithmic trading platform using the best off-the-shelf open source
technology stack to be found.

hft is created and maintained by [Tony Day](http://scarcecapital.com).

## Quick start

There is no quick start for hft.  The easiest way to get up to speed is to read the project [blog](http://scarcecapital.com/hft).  If you're interested in contributing to development or find a logic bug, then fork me with:

```
$ git clone https://github.com/tonyday567/hft.git
```

# technology stack #

The world of high frequency trading is a broad church of opinion, technology, ideas and motivations.  hft is being developed using many different tools:

### [emacs](http://www.gnu.org/software/emacs/), [org-mode](http://orgmode.org) and literate programming###

[hft.org](https://github.com/tonyday567/hft/blob/master/hft.org) is the nerve
center of active development and contains just about all the important code, research notes
and design tools being used.

The project makes heavy use of [babel](http://orgmode.org/worg/org-contrib/babel/) to pick and mix between coding environments and languages, whilst still remaining [literate](http://www.haskell.org/haskellwiki/Literate_programming):

>The main idea is to regard a program as a communication to human beings rather than as a set of instructions to a computer. ~ Knuth

Similarly, a project such as hft is as much about communication between human beings as it is about maintenance of source code.

### [R](http://www.r-project.org) ###

R is a strongly functional but imperative language being used for rapid
development and research of hft and algo ideas as they arise. Most everything
that you can think of (databases, broker interfaces, statistical analysis,
visualization) has an R package ready to get you up and going in 5 minutes.

### [haskell](http://www.haskell.org/haskellwiki/Haskell) ###

R can be many things but what it is least set up for is development of
asyncronous code. To fill this gap, the project is using haskell to frame the
system as and when it develops.

### [Interactive Brokers](http://www.interactivebrokers.com/en/main.php) ###

Eventually, hft will be broker independent but during the development phase IB
is the test case. Interactive has the most mature API that works out of the
box and a demo account so that hft can come pre-plumbed so that (eventually)
the project can also run out of the box.

Interactive Brokers consolidates tick data into 0.3 second time slices so it
isn't appropriate for low-latency work.

### [iqfeed](http://www.iqfeed.net)  ###

Just because it's open-source doesn't mean that it's cost free. iqfeed has
been chosen as an initial data feed to base project R&D efforts on. iqfeed
costs dollars but the software can be downloaded for free and a demo version
allows live data to flow with a lag.

A useful way to support the hft project is to let DTN know if you decide to
purshase iqfeed due to the project.

## bug tracker

Have a bug or a feature request? [Please open a new issue](https://github.com/tonyday567/hft/issues). 

## Community

hft is sponsored by [Scarce Capital](http://scarcecapital.com) as an adjunct to client advisory services.

Follow [@scarcecapital on Twitter](http://twitter.com/scarcecapital).

Read, subscribe (and contribute!) to the [The Official hft Blog](http://scarcecapital.com/hft).

The project is partially due to active discussions on the [Open Source HFT Linkedin group](http://www.linkedin.com/groups?home=&gid=4405119&trk=anet_ug_hm)

## Contributing

Please submit all pull requests against the master branch.

Thanks!

## Authors

**Tony Day**

+ [http://twitter.com/tonyday567](http://twitter.com/tonyday567)
+ [http://github.com/tonyday567](http://github.com/tonyday567)


## Copyright and license

Copyright 2013 Scarce Capital.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.