# Stroom Content

_Stroom Content_ is a repository of the content definition files used to import entities into _Stroom_. Entities are such things as XML Schemas, XSLT translations, data splitter definitions, pipelines, dashboards, visualisations, etc. This repository provides a means to share common _Stroom_ content in a form that can be imported into multiple instances of _Stroom_.

The content is grouped into a number of _content packs_ which can each be built into a zip file that is ready for import directly into _Stroom_.

#### Caution!
 
**Errors/problems will arise if you import an incompatible content pack into your version of Stroom.**

If you wish to build a previous version of a particular content pack, you will need to `git checkout` the appropriately
named git tag.

## Content pack contents

The following content packs are currently available.  Click on the link for details of what is in each content pack.
In each content pack section is a table detailing the different versions of the pack along with details of which versions of Stroom it is compatible with.


### [**core-xml-schemas**](./source/core-xml-schemas/README.md)

The core XML Schemas required by Stroom for basic operation.

#### Compatibility matrix

| Pack version                                                                      | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| --------------------------------------------------------------------------------- | ------------ | ------------ | -------------|
| [v2.2](https://github.com/gchq/stroom-content/releases/tag/core-xml-schemas-v2.2) | Y            | Y            | Y            |
| [v2.1](https://github.com/gchq/stroom-content/releases/tag/core-xml-schemas-v2.1) | Y            | Y            | Y            |
| [v2.0](https://github.com/gchq/stroom-content/releases/tag/core-xml-schemas-v2.0) | Y            | Y            | Y            |
| [v1.1](https://github.com/gchq/stroom-content/releases/tag/core-xml-schemas-v1.1) | Y            | Y            | Y            |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/core-xml-schemas-v1.0) | Y            | Y            | Y            |



### [**event-logging-xml-schema**](./source/event-logging-xml-schema/README.md)

An XML Schema standard for describing audit events.

#### Compatibility matrix

| Pack version                                                                                  | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| --------------------------------------------------------------------------------------------- | ------------ | ------------ | -------------|
| [v3.4.2](https://github.com/gchq/stroom-content/releases/tag/event-logging-xml-schema-v3.4.2) | Y            | Y            | Y            |
| [v3.2.3](https://github.com/gchq/stroom-content/releases/tag/event-logging-xml-schema-v3.2.3) | Y            | Y            | Y            |
| [v3.1.2](https://github.com/gchq/stroom-content/releases/tag/event-logging-xml-schema-v3.1.2) | Y            | Y            | Y            |
| [v3.1.1](https://github.com/gchq/stroom-content/releases/tag/event-logging-xml-schema-v3.1.1) | Y            | Y            | Y            |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/event-logging-xml-schema-v1.0)     | Y            | Y            | Y            |



### [**internal-dashboards**](./source/internal-dashboards/README.md)

A set of _Dashboard_ entities for displaying various metrics about the state of the _Stroom_ application and the undelying hardware and file systems.

#### Compatibility matrix

| Pack version                                                                         | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| ------------------------------------------------------------------------------------ | ------------ | ------------ | -------------|
| [v1.1](https://github.com/gchq/stroom-content/releases/tag/internal-dashboards-v1.1) | Y            | Y            | Y            |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/internal-dashboards-v1.0) | Y            | Y            | Y            |



### [**internal-statistics-sql**](./source/internal-statistics/README.md)

A set of _StatisticStore_ entities for representing the internal statistics generated by Stroom and record by the SQL Statistics service. This pack was previously known as 'internal-statistics' so the versions in the matrix below refer to either name.

#### Compatibility matrix

| Pack version                                                                             | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| ---------------------------------------------------------------------------------------- | ------------ | ------------ | ------------ |
| [v2.1](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-sql-v2.1) | No           | Y            | Y            |
| [v2.0](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-sql-v2.0) | No           | Y            | Y            |
| [v1.2](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-v1.2)     | Y            | No           | No           |
| [v1.1](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-v1.1)     | Y            | No           | No           |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-v1.0)     | Y            | No           | No           |



### [**internal-statistics-stroom-stats**](./source/internal-statistics/README.md)

A set of _StroomStatsStore_ entities for representing the internal statistics generated by Stroom and recorded by the Stroom-Stats service.

#### Compatibility matrix

| Pack version                                                                                      | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| ------------------------------------------------------------------------------------------------- | ------------ | ------------ | ------------ |
| [v2.1](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-stroom-stats-v2.1) | No           | Y            | Y            |
| [v2.0](https://github.com/gchq/stroom-content/releases/tag/internal-statistics-stroom-stats-v2.0) | No           | Y            | Y            |



### [**standard-pipelines**](./source/standard-pipelines/README.md) 

A set of standard data format agnostic pipelines for processing data.

| Pack version                                                                                        | Stroom 5.0.x   | Stroom 6.0.x  | Stroom 7.0.x |
| --------------------------------------------------------------------------------------------------- | -------------- | ------------- | ------------ |
| [v0.2](https://github.com/gchq/stroom-content/releases/tag/standard-pipelines-v0.2)                 | No             | Y             | Y            |
| [v0.1](https://github.com/gchq/stroom-content/releases/tag/standard-pipelines-v0.1)                 | No             | Y             | Y            |



### [**stroom-101**](./source/stroom-101/README.md)

The entities used in the [quick start guide](https://gchq.github.io/stroom-docs/quick-start-guide/quick-start.html)

#### Compatibility matrix

| Pack version                                                                | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| --------------------------------------------------------------------------- | ------------ | ------------ | ------------ |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/stroom-101-v1.0) | Y            | Y            | Y            |



### [**stroom-logs**](./source/stroom-logs/README.md)

#### Compatibility matrix

| Pack version                                                                                 | Stroom 5.0.x | Stroom 6.0.x | Stroom 7.0.x |
| -------------------------------------------------------------------------------------------- | ------------ | ------------ | -------------|
| [v3.0-beta.1](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v3.0-beta.1)   | No           | No           | Y            |
| [v2.0-alpha.5](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v2.0-alpha.5) | No           | Y            | Y            |
| [v2.0-alpha.4](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v2.0-alpha.4) | No           | Y            | Y            |
| [v2.0-alpha.3](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v2.0-alpha.3) | No           | Y            | Y            |
| [v2.0-alpha.2](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v2.0-alpha.2) | No           | Y            | Y            |
| [v2.0-alpha.1](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v2.0-alpha.1) | No           | Y            | Y            |
| [v1.1](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v1.1)                 | No           | Y            | Y            |
| [v1.0](https://github.com/gchq/stroom-content/releases/tag/stroom-logs-v1.0)                 | No           | Y            | Y            |



### [**template-pipelines**](./source/template-pipelines/README.md) 

A set of template pipelines that other pipelines can inherit from.

| Pack version                                                                                        | Stroom 5.0.x   | Stroom 6.0.x  |Stroom 7.0.x |
| --------------------------------------------------------------------------------------------------- | -------------- | ------------- |-------------|
| [v0.4](https://github.com/gchq/stroom-content/releases/tag/template-pipelines-v0.4)                 | No             | No            | No          |
| [v0.3](https://github.com/gchq/stroom-content/releases/tag/template-pipelines-v0.3)                 | No             | No            | Y           |
| [v0.2](https://github.com/gchq/stroom-content/releases/tag/template-pipelines-v0.2)                 | No             | Y             | Y           |
| [v0.1](https://github.com/gchq/stroom-content/releases/tag/template-pipelines-v0.1)                 | No             | Y             | Y           |



## Building the content packs

Each content pack is defined as a directory within _stroom-content-source_ with the name of content pack being the name of the directory.

There are currently two methods to building content packs, a Gradle build or a python script. The former has superseded the latter, though the python script is still useful if you want all packs built into a single zip file. For all other purposes the Gradle build should be favoured.

### Gradle build

The Gradle build will manage the dependencies between content packs, including transitive dependencies, so if you want a pack that has dependencies on other packs then those dependency packs will get built with it. Running the build requires _xmllint_ and _python_.

To run a full build of all packs do:

`./gradlew clean build`

If you just want to validate the pack's source to make sure the UUID references are correct and there are no clashes, then do:

`./gradlew validate`

To build a single pack do something like:

`./gradlew clean :my-pack-name:build`

The build will place the following pairs of zip files in `./build/distributions`:

- `my-pack-name.zip`

- `my-pack-name-all.zip`

The `-all` variant contains all dependency packs and is therefore larger. 
The other zip just contains the named pack with no dependencies.

## Released content packs

To see all the pre-built content packs see the [releases page](https://github.com/gchq/stroom-content/releases).

## Importing the content packs

The content pack zip files can be imported into _Stroom_ by selecting _Import_ from the _Tools_ menu.

## Content pack development

The _Stroom_ entities defined within _stroom-content-source/_ are all serialised forms, with XML as the serialisation format. Some entities consist of two files, one for the core entity and one for any significant payload, e.g. XSLT, JavaScript, JSON, etc. It is not recommended to create these entities by hand. The easiest way to create new content or to amend existing content is from within _Stroom_ and then use the Export function to export the content to its serialised form for inclusion in _stroom-content_.

### IMPORTANT - A word about UUIDs

Each _Stroom_ entity is identified by a [Universally Unique Identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier). Where entities have dependencies on other entities, e.g. a _Dashboard_ entity depends on a _StatisticStore_ entity, this dependency relationship is defined by the UUID of the dependency entity. It is possible to import content into _Stroom_ with missing dependencies as this can sometimes be a valid use case, though with missing dependencies the entities will not work correctly until the dependencies are resolved, e.g. by updating the dependency.

All the entities defined in these content packs are defined with hard coded UUIDs and dependencies.  It is therefore **critical** that the correct UUIDs are used in the entity and dependency definitions in the XML.

It is likely that a content pack will contain entities that depend on entities in other content packs. This is so that we can have some common entities, e.g. template pipelines, that can be used by multiple packs, with the intention that only those packs that are needed are imported.

### Duplication between packs

It is possible for multiple packs to include the Folder entities with the same path structure, however they **must** have the same UUID. Duplication of other entity types should be avoided.

### Creating new content

New content should be crafted in _Stroom_, ideally an empty development instance of _Stroom_. If the new content relies on any entities from other content packs then these should first be imported into _Stroom_ so that the dependencies can be correctly defined. The new content should be created in the chosen folder structure. Once the content has been created, use the _Export_ function to export the folder(s) that contains it.

The _Export_ function will create a zip file containing all the serialised entities complete with the original path structure. You should create a directory under _stroom-content-source/_ with the name being the name of the content-pack. The content of the zip file should be unzipped into this directory. 

### Modifying existing content

Minor changes to existing content pack can be made by editing the XML files directly, though testing the pack in an instance of Stroom is advised to ensure the change works.  More complex changes should be done by importing the pack to be changed and any dependencies into a vanilla instance of stroom, making the changes in Stroom and then exporting the packs out. The exported pack should be unzipped into the pack's _stroomContent_ directory for addition into source control.  It is advisable to remove any of the audit trail elements (`createUser`, `createTime`,`updateUser` & `updateTime`) that Stroom adds in to the XML file as these are not required in content packs and may result in warnings on import if left in.

### Gradle dependencies

The dependencies between content packs are also defined in the Gradle `build.gradle` file in the root of each content pack directory. The `createSkeletonPack.sh` script will create a skeleton `build.gradle` file for you with an example of how to define dependencies on other packs. A pack should define all direct dependencies it has in its entities and not rely on transitive dependencies as this is more explicit.

### Helper scripts

The following helper shell scripts exist to assist in content pack creation.

#### createSkeletonPack.sh

This script will create a skeleton structure for a new content pack.

`./createSkeletonPack.sh my-new-pack`

#### createNewStroomFolder.sh

This script can be run from within an directory to create a new Stroom Folder (XML definition file and directory). This should only be used to create a directory that doesn't already exist in Stroom as it will have a new UUID generated for it.

#### removeAuditElements.py

This script (_requires python3_) will strip the audit elements (e.g. `<createUser>...</createUser>`) from all xml files. This is to make it easier to clean any content generated in stroom and exported out for inclusion in a content pack.
